// constants
var zTable = -1;
var twenty = 25;
var interval = 2000;
var padding = 10;
var fontSize = 14;

// tables
var openPortsTitle = "Open Ports";
var systemdAnalyzeTitle = "Systemd Analyze";
var bootTiemTitle = "Boot Time";
var topMemoryTitle = "Top Memory";
var upTimeTitle = "Up Time";
var topProcessTitle = "Top Process";
var hardDiskTitle = "Hard Disk Info";
var activeServiceTitle = "Active Services"
var environmentTitle = "Environment Variables";

var locked = "Locked :(";

var topMemoryPopUp = "Show top-10 applications that consume your memory."
var topProcessPopUp = "Show top-10 applications that consume your Cpu."
var hardDiskPopUp = "Show hard disk info."
var activeServicePopUp = "Show running services."
var environmentPopUp = "Show Environment Variables."
var openPortsPopUp = "Show Open Ports."
var systemdAnalyzePopUp = "The result of systemd-analyze blame"
var bootTiemPopUp = "Show the system boot time."

// columns
// launcherActiveServices
var lasFirst = "Unit"
var lasSecond = "Description"

// luancherHardDisk
var lhdFirst = "File System";
var lhdSecond = "Size";
var lhdThird = "Used";
var lhdForth = "Available";
var lhdFifth = "%Use";
var lhdSixth = "Mounted On";

// launcherInfo
var liFirst= "Env";
var liSecond= "Value";

// launcherMemory
var lmFirst = "PID";
var lmSecond = "COMMAND";
var lmThird = "%Memory";

// launcherOpenPorts
var lopFirst = "PID/Program";
var lopSecond = "Address";
var lopThird = "Protocol";

// launcherSystemdAnalyze
var lsdaFirst = "Time"
var lsdaSecond = "Unit"

// launcherBootTime
var lbtFirst = "Title"
var lbtSecond = "Time"

// launcherProcess
var lpFirst = "PID";
var lpSecond = "COMMAND";
var lpThird = "%CPU";

var gnuLinux = "GNU/Linux is an operating system, a large piece of software that manages a computer. It is similar to Microsoft Windows, but it is entirely free. The accurate name is GNU/Linux.";

var systemAgeTitle = "System Age";
var grapchicCardsTitle = "Graphic Cards";
var torStatusTitle = "Tor Status";
var grapchicCardsPopUp = "Show all graphic cards available in the system.";
var torStatusPopUp = "Show the status of tor service.";
var systemAgePopUp = "How old are your system?";
var upTimeTitle = "Up Time";
var upTimePopUp = "Show the Uptime";
