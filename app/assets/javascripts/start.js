$(document).ready(function () {
    // will call refreshPartial every 3 seconds
    setInterval(refreshPartial, 3000);
    var thirtySeconds = 30;
    var display = $('#time');
    startTimer(thirtySeconds, display);
});

function refreshPartial() {
    $.ajax({
        url: "/quiz/refresh_users"
    })
}

function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
            window.location = "/quiz/question";
        }

    }, 1000);
}