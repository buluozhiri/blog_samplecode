using UnityEngine;
using System.Collections;
using System.Collections.Generic;

/*
Description		:   ״̬���࣬��ɫ��ÿһ��״̬��Ӧ��һ��FSM���ʵ��������������
             ״̬�����߼������Կ��Ǽ̳�ʵ��FSM
Author		:    Jeg
CreateTime	:  2016-7-22 16:21:17
*/

    public class FSM
    {
        //FSMΨһID
        protected FSMState _state = FSMState.INVALID;
        public FSMState State { get { return this._state; } }
        public static Dictionary<FSMTransitCondition, FSMState> _stateDictionary = new Dictionary<FSMTransitCondition, FSMState>();
        public static List<FSMTransitConditionPriority> _conditionList = new List<FSMTransitConditionPriority>();

        public FSM(FSMState state)
        {
            this._state = state;
        }

        /// <summary>
        /// ���״̬ת������
        /// </summary>
        /// <param name="condition">ת����һ��״̬���������</param>
        /// <param name="state">ת����һ�ֵ�״̬</param>
        public void AddTransition(FSMTransitCondition condition, FSMState state)
        {
            if (condition == FSMTransitCondition.INVALID)
            {
                Debug.LogError("Error: You want to add condition is INVALID...");
                return;
            }

            if (state == FSMState.INVALID)
            {
                Debug.LogError("Error: You want to add state is INVALID...");
                return;
            }

            if (_stateDictionary.ContainsKey(condition))
            {
                Debug.LogWarningFormat("Warning: You want to add condition {0} to state {1}. But this condition had exist...",
                System.Enum.GetName(typeof(FSMTransitCondition), condition),
                System.Enum.GetName(typeof(FSMState), state));
                return;
            }

            _stateDictionary.Add(condition, state);
        }

        /// <summary>
        /// ɾ����Ӧ����������״̬
        /// </summary>
        /// <param name="condition">Ҫɾ��������</param>
        public void DeleteTransition(FSMTransitCondition condition)
        {
            if (condition == FSMTransitCondition.INVALID)
            {
                Debug.LogError("Error: You want to delete condition is INVALID...");
                return;
            }

            if (_stateDictionary.ContainsKey(condition))
            {
                _stateDictionary.Remove(condition);
                return;
            }
            Debug.LogErrorFormat("Error: Could not delete condition {0}...",
               System.Enum.GetName(typeof(FSMTransitCondition), condition));
        }

        /// <summary>
        /// ���ݸ������������������ؽ���ת�������״̬ 
        /// </summary>
        /// <param name="condition">��������������</param>
        /// <returns>ת�������״̬</returns>
        public FSMState GetOutputState(FSMTransitCondition condition)
        {
            if (_stateDictionary.ContainsKey(condition))
            {
                return _stateDictionary[condition];
            }
            Debug.LogWarningFormat("Warning: Could not found the condition {0}, return INVALID...",
                System.Enum.GetName(typeof(FSMTransitCondition), condition));
            return FSMState.INVALID;
        }

        /// <summary>
        /// ����ÿ��Ǩ�����������ȼ�����ֵԽС���ȼ�Խ��
        /// </summary>
        /// <param name="condition">Ǩ������</param>
        /// <param name="priority">Ǩ��������Ӧ�����ȼ�, Ĭ��Ϊ���</param>
        public void SetStateTransitConditionPriority(FSMTransitCondition condition, uint priority = uint.MaxValue)
        {
            FSMTransitConditionPriority cp = new FSMTransitConditionPriority(condition, priority);
            _conditionList.Add(cp);
        }

        /// <summary>
        /// ��ȡ��״̬�л�������״̬�������У����ȼ���ߵ��Ǹ�����
        /// </summary>
        /// <param name="conditions">�����б�</param>
        /// <returns></returns>
        public FSMTransitCondition GetPrioritizedCondition(List<FSMTransitCondition> conditions)
        {
            int conditionCount = conditions.Count;

            if (0 == conditionCount)
            {
                Debug.LogError("Error: The condition list is empty...");
                return FSMTransitCondition.INVALID;
            }

            if (1 == conditionCount)
            {
                return conditions[0];
            }

            FSMTransitCondition resultCondition = conditions[0];
            uint resultPriority = this.GetConditionPriority(resultCondition);
            FSMTransitCondition curCondition;
            uint curPriority;

            for (int i = 1; i < conditionCount; ++i)
            {
                curCondition = conditions[i];
                curPriority = this.GetConditionPriority(curCondition);

                //�����ǰ�����condition�����ȼ�ֵС����һ��
                if (resultPriority > curPriority) 
                {
                    resultPriority = curPriority;
                    resultCondition = curCondition;
                }
            }
            return resultCondition;
        }

        /// <summary>
        /// ���ݴ��ݽ�������������ȡ����Ӧ�����ȼ�
        /// </summary>
        /// <param name="condition">���ж����ȼ�������ֵ</param>
        /// <returns>���ش��ж�����������Ӧ�����ȼ�</returns>
        public uint GetConditionPriority(FSMTransitCondition condition)
        {
            for (int i = 0, length = _conditionList.Count; i < length; i++)
            {
                if (_conditionList[i]._condition == condition)
                {
                    return _conditionList[i]._priority;
                }
            }
            return uint.MaxValue;
        }

        /// <summary>
        /// ����״̬ʱ�߼�����
        /// </summary>
        public virtual void EnterState()
        {
            //Debug.LogFormat("Enter {0}", _state); 
        }

        /// <summary>
        /// ���ڸ�״̬���������߼�����
        /// </summary>
        public virtual void ExecuteState() { }

        /// <summary>
        /// �뿪״̬ʱ�߼�����
        /// </summary>
        public virtual void ExitState()
        {
            //Debug.LogFormat("Exit {0}", _state); 
        }

        /// <summary>
        /// �������������ĸı䲢������Ӧ���¼�ת��
        /// </summary>
        /// <param name="obj"></param>
        public virtual void Reason(GameObject obj) { }
    }
