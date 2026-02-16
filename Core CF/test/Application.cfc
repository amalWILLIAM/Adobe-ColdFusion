component {


	this.Name = "CF_Training";
    this.applicationTimeout = createTimeSpan(1, 0, 0, 0);
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 2, 0, 0);
    this.customTagPaths = [expandPath("./customtags/")];

    this.datasource = "cfdb";

    function onApplicationStart() {
        application.startedAt = now();
        return true;
    }

    function onSessionStart() {
        session.startedAt = now();
    }

    function onRequestStart(requestname) {
        return true;
    }

}