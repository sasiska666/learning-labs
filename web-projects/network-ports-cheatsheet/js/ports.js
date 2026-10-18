var PORTS = [
  [20, "TCP", "FTP data", "Unencrypted file transfer"],
  [21, "TCP", "FTP control", "Unencrypted; prefer SFTP"],
  [22, "TCP", "SSH", "Secure remote shell and SFTP"],
  [23, "TCP", "Telnet", "Unencrypted; avoid"],
  [25, "TCP", "SMTP", "Mail transfer between servers"],
  [53, "TCP/UDP", "DNS", "Name resolution"],
  [67, "UDP", "DHCP server", "Address assignment"],
  [68, "UDP", "DHCP client", "Address assignment"],
  [80, "TCP", "HTTP", "Web, unencrypted"],
  [110, "TCP", "POP3", "Mail retrieval, unencrypted"],
  [123, "UDP", "NTP", "Time sync"],
  [143, "TCP", "IMAP", "Mail access, unencrypted"],
  [161, "UDP", "SNMP", "Network device monitoring"],
  [389, "TCP/UDP", "LDAP", "Directory services"],
  [443, "TCP", "HTTPS", "Web over TLS"],
  [445, "TCP", "SMB", "Windows file sharing"],
  [465, "TCP", "SMTPS", "Mail submission over TLS"],
  [587, "TCP", "SMTP submission", "Mail submission with STARTTLS"],
  [993, "TCP", "IMAPS", "IMAP over TLS"],
  [995, "TCP", "POP3S", "POP3 over TLS"],
  [3306, "TCP", "MySQL", "Database"],
  [3389, "TCP", "RDP", "Windows remote desktop"],
  [5432, "TCP", "PostgreSQL", "Database"],
  [6379, "TCP", "Redis", "In-memory store"],
  [8080, "TCP", "HTTP alternate", "Common dev and proxy port"]
];

function render(list) {
  var body = document.getElementById("rows");
  body.textContent = "";
  list.forEach(function (r) {
    var tr = document.createElement("tr");
    r.forEach(function (cell) {
      var td = document.createElement("td");
      td.textContent = cell;
      tr.appendChild(td);
    });
    body.appendChild(tr);
  });
  document.getElementById("count").textContent = list.length + " of " + PORTS.length + " ports";
}

function filter(q) {
  q = q.trim().toLowerCase();
  if (!q) return PORTS;
  return PORTS.filter(function (r) { return r.join(" ").toLowerCase().indexOf(q) !== -1; });
}

if (typeof document !== "undefined") {
  render(PORTS);
  document.getElementById("q").addEventListener("input", function (e) { render(filter(e.target.value)); });
}
if (typeof module !== "undefined") module.exports = { PORTS: PORTS, filter: filter };
