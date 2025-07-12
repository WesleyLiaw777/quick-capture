#Requires AutoHotkey v2.0

; ATTENTION: You only have to change this line! 
webhookUrl := "https://hook.us2.make.com/a74nfetwnq9unwfe5v8afbbgk4d3g5po"



^!n::
{
    userInput := InputBox("Note:", "Quick Note", "w200 h100").value
    if (userInput = "")
        return ; don't send if empty

    ; Construct the JSON payload
    payload := Format('{"note":"{1}"}', StrReplace(userInput, '"', '\"'))

    ; Create and send the HTTP request
    http := ComObject("WinHttp.WinHttpRequest.5.1")
    http.Open("POST", webHookUrl, false)
    http.SetRequestHeader("Content-Type", "application/json")
    http.Send(payload)

    if (http.Status != 200) {
        MsgBox "Failed to send note. HTTP Status: " http.Status
    }
}
