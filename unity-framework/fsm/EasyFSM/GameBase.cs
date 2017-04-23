using UnityEngine;
using System.Collections;
using System.Collections.Generic;

/*
Description		:   ��Ϸ״̬����, ������Ϸ״̬���̳д���
Author		:    Jeg
CreateTime	:  2016-7-29 15:40:40
*/
public class GameBase
{
    protected GameState _state = GameState.INVALID;
    public GameState State
    {
        get { return this._state; }
        //set { this._state = value; }
    }

    public GameBase(GameState state)
    {
        _state = state;
    }

    /// <summary>
    /// ����״̬����
    /// ������д�÷���
    /// </summary>
    public virtual void OnEnter()
    {
        GameManager.Instance.CurrentState = _state;
        Debug.LogFormat("Enter {0}", _state);
    }

    /// <summary>
    /// ����״̬�е���
    /// ������д�÷���
    /// </summary>
    public virtual void OnExecute() { }

    /// <summary>
    /// �˳�״̬����
    /// ������д�÷���
    /// </summary>
    public virtual void OnExit()
    {
        //Debug.LogFormat("Exit {0}", _state);
    }

}