﻿using UnityEngine;
using System;
using System.Reflection;

public class MonoVersion : MonoBehaviour {
	void Start()
	{
		Type type = Type.GetType("Mono.Runtime");
		if (type != null)
		{
			MethodInfo info = type.GetMethod("GetDisplayName", BindingFlags.NonPublic | BindingFlags.Static);
			
			if (info != null)
				Debug.Log(info.Invoke(null, null));
		}
      //Debug.Log(System.Enviroment.Version);//net version?
	}
}