function TraceInfoFlag() {
    this.traceFlag = new Array();
    this.traceFlag["Mysubsystem.c:45c20"]=1;
    this.traceFlag["Mysubsystem.c:45c30"]=1;
    this.traceFlag["Mysubsystem.c:45c40"]=1;
    this.traceFlag["Mysubsystem.c:45c61"]=1;
    this.traceFlag["Mysubsystem.c:45c70"]=1;
    this.traceFlag["Mysubsystem.c:46c34"]=1;
    this.traceFlag["Mysubsystem.c:46c45"]=1;
    this.traceFlag["Mysubsystem.c:46c55"]=1;
    this.traceFlag["Mysubsystem.c:46c65"]=1;
    this.traceFlag["Mysubsystem.c:47c24"]=1;
    this.traceFlag["Mysubsystem.c:47c34"]=1;
    this.traceFlag["Mysubsystem.c:47c56"]=1;
    this.traceFlag["Mysubsystem.c:47c67"]=1;
    this.traceFlag["Mysubsystem.c:48c33"]=1;
    this.traceFlag["Mysubsystem.c:48c44"]=1;
}
top.TraceInfoFlag.instance = new TraceInfoFlag();
function TraceInfoLineFlag() {
    this.lineTraceFlag = new Array();
    this.lineTraceFlag["Mysubsystem.c:45"]=1;
    this.lineTraceFlag["Mysubsystem.c:46"]=1;
    this.lineTraceFlag["Mysubsystem.c:47"]=1;
    this.lineTraceFlag["Mysubsystem.c:48"]=1;
    this.lineTraceFlag["Mysubsystem.c:53"]=1;
    this.lineTraceFlag["Mysubsystem.c:58"]=1;
    this.lineTraceFlag["Mysubsystem.c:59"]=1;
    this.lineTraceFlag["Mysubsystem.c:64"]=1;
    this.lineTraceFlag["Mysubsystem.c:65"]=1;
    this.lineTraceFlag["Mysubsystem.c:68"]=1;
    this.lineTraceFlag["Mysubsystem.c:69"]=1;
}
top.TraceInfoLineFlag.instance = new TraceInfoLineFlag();
