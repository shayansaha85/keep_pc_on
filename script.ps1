Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Keyboard {
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, uint dwExtraInfo);
    public const byte VK_CAPITAL = 0x14;
    public const uint KEYEVENTF_KEYUP = 0x0002;
    public const uint KEYEVENTF_KEYDOWN = 0x0000;
    
    public static void PressCapsLock() {
        keybd_event(VK_CAPITAL, 0, KEYEVENTF_KEYDOWN, 0);
        keybd_event(VK_CAPITAL, 0, KEYEVENTF_KEYUP, 0);
    }
}
"@

while ($true) {
    [Keyboard]::PressCapsLock()
    Start-Sleep -Seconds 1
}
