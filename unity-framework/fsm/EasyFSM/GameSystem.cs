using UnityEngine;
using System.Collections;
using System.Collections.Generic;



/*
Description		:   ��Ϸ״̬�ܿ�
Author		:    Jeg
CreateTime	:  2016-7-30 10:10:40
*/
public class GameSystem
{
    private Dictionary<GameState, GameBase> _gameDictionary;
    //��ֵ����ֱ���޸�, ֻ��ͨ��״̬ת��
    private GameState _currentState;
    public GameState CurrentState { get { return this._currentState; } }
    //��¼��ǰGameBase
    private GameBase _currentBase;
    public GameBase CurrentBase { get { return this._currentBase; } }

    public GameSystem()
    {
        _gameDictionary = new Dictionary<GameState, GameBase>();
    }

    /// <summary>
    /// ���һ���µ�GameBase����ӳ�����
    /// </summary>
    /// <param name="gbase">����ӵ�GameBase����</param>
    public void AddState(GameBase gbase)
    {
        if (gbase == null)
        {
            Debug.LogError("Error: Null reference is not allowed...");
        }

        //��һ�����ʱ�ض�ִ������, ��Ϊһ��ʼlist�ǿյ�, �������������˵�һ����ӵ�״̬��Ĭ�ϵ�״̬
        if (this._gameDictionary.Count == 0)
        {
            this._gameDictionary.Add(gbase.State, gbase);
            //��ʼ������ֵ
            this._currentState = gbase.State;
            this._currentBase = gbase;
            //ִ�г�ʼ״̬��Enter
            this._currentBase.OnEnter();
            return;
        }

        if (this._gameDictionary.ContainsKey(gbase.State))
        {
            Debug.LogErrorFormat("Error: {0} has already been added...",
                    System.Enum.GetName(typeof(GameState), gbase.State));
            return;
        }
        this._gameDictionary.Add(gbase.State, gbase);
    }

    /// <summary>
    /// ���б��и��ݵ�ǰ��stateɾ����֮��Ӧ��GameBase����
    /// </summary>
    /// <param name="state">Ҫɾ����״̬key</param>
    public void DeleteState(GameState state)
    {
        if (state == GameState.INVALID)
        {
            Debug.LogError("Error: Could not delete the gamebase, INVALID is not allowed for a real state...");
            return;
        }

        if (this._gameDictionary.ContainsKey(state))
        {
            this._gameDictionary.Remove(state);
            return;
        }
        Debug.LogErrorFormat("Error: {0} was not on the list of states...",
            System.Enum.GetName(typeof(GameState), state));
    }

    /// <summary>
    /// ���б��и��ݵ�ǰ��state��ȡ��֮��Ӧ��GameBase����
    /// </summary>
    /// <param name="state">Ҫ��ȡGameBase�����key</param>
    /// <returns>����״̬��Ӧ��GameBase����</returns>
    public GameBase GetState(GameState state)
    {
        GameBase gbase = null;
        if (state == GameState.INVALID)
        {
            Debug.LogError("Error: Could not get the gamebase, INVALID is not allowed for a real state...");
            return null;
        }
        if (this._gameDictionary.ContainsKey(state))
        {
            gbase = this._gameDictionary[state];
        }
        else
        {
            Debug.LogErrorFormat("Error: Could not get the gamebase, {0} was not on the list of states...",
                System.Enum.GetName(typeof(GameState), state));
        }
        return gbase;
    }


    /// <summary>
    /// ״̬ת��, ��ǰ״̬����һ��״̬�л�ʱ�Ĳ���
    /// </summary>
    /// <param name="state">������Ҫת����״̬</param>
    public void PerformTransition(GameState state)
    {
        if (state == GameState.INVALID)
        {
            Debug.LogError("Error: INVALID is not allowed for a real state...");
            return;
        }

        GameState curState = this._currentState;
        if (curState != state)
        {
            //��ֵ��ǰ״̬Ϊת�����״̬
            this._currentState = state;
            this.OnStateTransited(curState, state);
        }
    }

    /// <summary>
    /// �⺯����PerformTransition�ڲ�����, ������PerformTransition
    /// �����ɹ�����״̬֮��, state�õ��ı�֮��, ����Ҫ��������, ����״̬��
    /// �л��ĺ��ĺ���
    /// </summary>
    /// <param name="curState">��ǰ״̬</param>
    /// <param name="nextState">��һ��״̬</param>
    protected virtual void OnStateTransited(GameState curState, GameState nextState)
    {
        //ת��ǰ״ִ̬��exit
        this.GetState(curState).OnExit();
        this._currentBase = this.GetState(nextState);
        //ת�����״ִ̬��enter
        this._currentBase.OnEnter();
    }

}
