<h1>Script by Jiraphat Yuenying</h1>
<h2>สคริปท์ติดตั้ง openvpn</h2>
<p>รันคำสั่งตามนี้</p>
<div>
    <ul>
        <li>wget https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/openvpn-auto-ub14.sh</li>
        <li>chmod +x openvpn-auto-ub14.sh</li>
        <li>./openvpn-auto-ub14.sh</li>
        <li>reboot หนึ่งรอบ</li>
    </ul>
</div>
<h2>สคริปท์ติดตั้ง เว็บสมัคร<br> https://github.com/jiraphaty/auto-script-vpn/blob/master/openvpnweb/ </h2>
<hr>
<h2>วิธีเปิดใช้งาน Login ด้วยรูท</h2>
 <ul>
    <li>ล็อกอินเข้าเครื่อง vps ด้วยรหัสที่คุณมี</li>
    <li>ทำตามขั้นตอน</li>
    <li>sudo -i</li>
    <linano /etc/ssh/sshd_config</li>
    <li>หาบรรทัด PermitRootLogin no เปลี่ยนเป็น PermitRootLogin yes</li>
    <li>หาบรรทัด PasswordAuthentication no เปลี่ยนเป็น PasswordAuthentication yes</li>
    <li>Ctrl + X</li>
    <li>Y</li>
    <li>service restart ssh (ใช้คำสั่งรีสตาร์ท ตามระบบ)</li>
</ul>
หรือ
