from  flask import *
import MySQLdb
con=MySQLdb.connect(host='localhost',user='root',passwd='root',port=3306,db='dvcs')
cmd=con.cursor()
root=Flask(__name__)

@root.route('/')
def main():
    return render_template("login.html")
@root.route('/login',methods=['get','post'])
def login():
    user_name=request.form['uname']
    passd=request.form['pass']
    cmd.execute("select * from login where userid='"+user_name+"' and password='"+passd+"'")
    s=cmd.fetchone()
    if s is None:
        return '''<script>alert('invalid ...');window.location='/'</script>'''
    elif s[3]=='admin':
        return render_template("adminhome.html")
    elif s[3]=='cyber cell':
        return render_template("cybercell home.html")
    else:
        return render_template("human right home.html")





@root.route('/home')
def home():
    return render_template("adminhome.html")

@root.route('/regdep')
def regdep():
    return render_template("reg.html")
@root.route('/regdep2',methods=['get','post'])
def regdep2():
    userid = request.form['email']
    department = request.form['dep']
    psd=request.form['pass']
    street = request.form['street']
    city = request.form['city']
    post = request.form['post']
    pin = request.form['pin']
    district = request.form['district']
    email = request.form['email']
    phone = request.form['phn']
    fax = request.form['fax']
    chairperson = request.form['cp']
    cmd.execute(
    "insert into reg values('" + userid + "','" + department + "','" + street + "','" + city + "','" + post + "','" + pin + "','" + district + "','" + email + "','" + phone + "','" + fax + "','" + chairperson + "')")
    cmd.execute("insert into login values('"+userid+"','"+psd+"','"+department+"')")
    con.commit()
    return '''<script>alert("inserted");window.location="regdep"</script>'''



@root.route('/collect')
def collect():
    return render_template("twittersearch.html")

@root.route('/download_report')
def download_report():
    return render_template("downloadreport.html")

@root.route('/search_history')
def search_history():

    return render_template("downloadreport.html")

@root.route('/download',methods=['get','post'])
def download():
     render_template("downloadreport.html")
@root.route('/dep_view',methods=['get','post'])
def dep_view():
    type=request.form['select']
    print(type)
    if type=='cyber cell':
        cmd.execute("select report_reply.*,admin_report.department from report_reply join admin_report on report_reply.report_id=admin_report.id where department='"+type+"'")
        c = cmd.fetchall()
        return render_template("downloadreport.html",val=c)
    else:
        cmd.execute("select report_reply.*,admin_report.department from report_reply join admin_report on report_reply.report_id=admin_report.id where department='"+type+"'")
        d = cmd.fetchall()
        return render_template("downloadreport.html",val=d)

@root.route('/send_report')
def send_report():
    return render_template("sendreport.html")
@root.route('/send_report2',methods=['get','post'])
def send_report2():
    title = request.form['title']
    file = request.form['file']
    cmd.execute("insert into cyber_report values(null,'" + title + "','"+file+"',curdate())")
    con.commit()
    return render_template("sendreport.html")
@root.route('/change_psd')
def change_psd():
    return render_template("change password.html")
@root.route('/change_psd2',methods=['get','post'])
def change_psd2():
    user_id = request.form['id']
    password=request.form['psd']
    newpsd=request.form['newpsd']
    cpsd=request.form['cpsd']
    cmd.execute("update login set password='"+cpsd+"' where userid='"+user_id+"' and password='"+password+"'")
    con.commit()
    return render_template("change password.html")
@root.route('/cyber_report_view')
def cyber_report_view():
    return render_template("cyber view report.html")








if(__name__=='__main__'):
    root.run(debug=True)