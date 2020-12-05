/**
 * Internal server command `defer`.
 */
#pragma semicolon 1
#include <sourcemod>

#pragma newdecls required

#define PLUGIN_VERSION "1.0.0"
public Plugin myinfo = {
	name = "Defer Server Utility",
	author = "nosoop",
	description = "Defers execution of commands until after configs have been executed",
	version = PLUGIN_VERSION,
	url = "https://github.com/nosoop"
}

#define MAX_COMMAND_LENGTH 1024

ArrayList g_DeferredCommands;

public void OnPluginStart() {
	g_DeferredCommands = new ArrayList(ByteCountToCells(MAX_COMMAND_LENGTH));
	
	RegServerCmd("defer", DeferCmd);
}

Action DeferCmd(int args) {
	char buffer[MAX_COMMAND_LENGTH];
	GetCmdArgString(buffer, sizeof(buffer));
	
	g_DeferredCommands.PushString(buffer);
}

public void OnConfigsExecuted() {
	while (g_DeferredCommands.Length) {
		char buffer[MAX_COMMAND_LENGTH];
		
		g_DeferredCommands.GetString(0, buffer, sizeof(buffer));
		g_DeferredCommands.Erase(0);
		
		ServerCommand("%s", buffer);
	}
}
