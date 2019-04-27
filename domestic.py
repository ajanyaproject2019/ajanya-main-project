from  flask import *
import os
from werkzeug.utils import secure_filename
import MySQLdb
con=MySQLdb.connect(host='localhost',user='root',passwd='root',port=3306,db='dvcs')
cmd=con.cursor()
root=Flask(__name__)
root.secret_key='abc'
UPLOAD_FOLDER = './static/file'
root.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
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
        session['id'] = s[0]
        return '''<script>alert('scucessfull ...');window.location='/home'</script>'''
    elif s[3]=='Cyber Cell':
        session['id'] = s[0]
        return '''<script>alert('scucessfull ...');window.location='/cyberhome'</script>'''
        return render_template("cybercell home.html")
    elif s[3] == 'Human Right':
        session['id'] = s[0]
        return '''<script>alert('scucessfull ...');window.location='/hhome'</script>'''

    else:
        return render_template("publichome.html")

@root.route('/pubhome')
def pubhome():
    return render_template("publichome.html")



@root.route('/home')
def home():
    return render_template("adminhome.html")

@root.route('/cyberhome')
def cyberhome():
    return render_template("cybercell home.html")

@root.route('/hhome')
def hhome():
    return render_template("human right home.html")

@root.route('/regdep')
def regdep():
    return render_template("reg.html")


@root.route('/uplaws')
def uplaws():
    return render_template("uploadlaw.html")
@root.route('/viewpost')
def viewpost():
    cmd.execute("select post.*,publicregistration.name from publicregistration  inner join post on post.uid=publicregistration.id")
    c = cmd.fetchall()
    print(c)
    return render_template("viewpost.html", val=c)

@root.route('/uploadlaw',methods=['get','post'])
def uploadlaw():
    try:
        title = request.form['title']
        file = request.files['file']
        img = secure_filename(file.filename)
        id = session['rid']
        file.save(os.path.join(root.config['UPLOAD_FOLDER'], secure_filename(file.filename)))

        cmd.execute("insert into law values(null,'" + str(id) + "', '" + title + "','" + img + "')")
        con.commit()
        return render_template("cybercell home.html")
    except  Exception as e:
        print (e)


@root.route('/public')
def public():
    return render_template("publicreg.html")

@root.route('/publicpost')
def publicpost():
    return render_template("post.html")

@root.route('/report_dep')
def report_dep():
    return render_template("report dep.html")

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
    cmd.execute("insert into login values(null,'"+userid+"','"+psd+"','"+department+"')")
    id=con.insert_id()
    print(id)
    cmd.execute("insert into reg values('"+str(id)+"','" + userid + "','" + department + "','" + street + "','" + city + "','" + post + "','" + pin + "','" + district + "','" + email + "','" + phone + "','" + fax + "','" + chairperson + "')")
    con.commit()
    return '''<script>alert("inserted");window.location="regdep"</script>'''



@root.route('/collect')
def collect():
    return render_template("twittersearch.html")

@root.route('/download_report')
def download_report():
    return render_template("downloadreport.html")

@root.route('/logout')
def logout():
    return render_template("login.html")

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
        cmd.execute("select reportreply.*,admin_report.department from reportreply join admin_report on reportreply.report_id=admin_report.id where department='"+type+"'")
        c = cmd.fetchall()
        print(c)
        return render_template("downloadreport.html",val=c)
    else:
        cmd.execute("select reportreply.*,admin_report.department from reportreply join admin_report on reportreply.report_id=admin_report.id where department='"+type+"'")
        d = cmd.fetchall()
        print(d)
        return render_template("downloadreport.html",val=d)

@root.route('/send_report')
def send_report():
    id = request.args.get('id')
    session['rid'] = id
    return render_template("sendreport.html")
@root.route('/send_report2',methods=['get','post'])
def send_report2():
    title = request.form['title']
    file = request.files['file']
    img = secure_filename(file.filename)
    id=session['rid']
    file.save(os.path.join(root.config['UPLOAD_FOLDER'], secure_filename(file.filename)))

    cmd.execute("insert into reportreply values(null,'"+str(id)+"', + '"+title + "','"+img+"',curdate())")
    cmd.execute("update admin_report set status='replied' where id='" + str(id) + "'")
    con.commit()
    return render_template("cybercell home.html")

@root.route('/human_report')
def human_report():
    id = request.args.get('id')
    session['rid'] = id
    return render_template("human_sendreport.html")
@root.route('/human_report2',methods=['get','post'])
def human_report2():
    title = request.form['title']
    file = request.files['file']
    img = secure_filename(file.filename)
    id=session['rid']
    file.save(os.path.join(root.config['UPLOAD_FOLDER'], secure_filename(file.filename)))

    cmd.execute("insert into reportreply values(null,'"+str(id)+"', + '"+title + "','"+img+"',curdate())")
    cmd.execute("update admin_report set status='replied' where id='" + str(id) + "'")
    con.commit()
    return render_template("human right home.html")

@root.route('/report_dept',methods=['get','post'])
def report_dept():
    dept=request.form['select']
    title = request.form['title']
    file = request.files['file']
    img=secure_filename(file.filename)
    file.save(os.path.join(root.config['UPLOAD_FOLDER'], secure_filename(file.filename)))

    cmd.execute("insert into admin_report values(null,'"+title+"','" + str(img) + "',curdate(),'pending','"+dept+"')")
    con.commit()
    return render_template("adminhome.html")
@root.route('/change_psd')
def change_psd():
    return render_template("change password.html")
@root.route('/change_psd2',methods=['get','post'])
def change_psd2():
        user_id = session['id']
        password=request.form['psd']
        newpsd=request.form['newpsd']
        cpsd=request.form['cpsd']
        if newpsd==cpsd:
            cmd.execute("update login set password='"+cpsd+"' where id='"+str(user_id)+"' and password='"+password+"'")
            con.commit()
            return '''<script>alert("password changed");window.location="/cyberhome"</script>'''

        else:
            return '''<script>alert("invalid password");window.location="/change_psd"</script>'''


@root.route('/hchange_psd')
def hchange_psd():
    return render_template("humanchangepass.html")
@root.route('/hchange_psd2',methods=['get','post'])
def hchange_psd2():
        user_id = session['id']
        password=request.form['psd']
        newpsd=request.form['newpsd']
        cpsd=request.form['cpsd']
        if newpsd==cpsd:
            cmd.execute("update login set password='"+cpsd+"' where id='"+str(user_id)+"' and password='"+password+"'")
            con.commit()
            return '''<script>alert("password changed");window.location="/hhome"</script>'''

        else:
            return '''<script>alert("invalid password");window.location="/hchange_psd"</script>'''


@root.route('/cyber_report_view')
def cyber_report_view():
    return render_template("cyber view report.html")
@root.route('/cyber_report_view2')
def cyber_report_view2():
    cmd.execute("select * from admin_report where department='Cyber Cell' and status='pending'")
    con.commit()
    d=cmd.fetchall()
    return render_template("cyber view report.html",val=d)
@root.route('/human_report_view')
def human_report_view():
    cmd.execute("select * from admin_report where department='Human Right' and status='pending'")
    con.commit()
    s=cmd.fetchall()
    print(s)
    return render_template("human view report.html",val=s)

@root.route('/publicreg',methods=['get','post'])
def publireg():
    name = request.form['textfield']
    place = request.form['textfield2']
    email = request.form['textfield3']
    phone=request.form['textfield4']
    cmd.execute("insert into login values(null,'" + email + "','"+phone+"','public')")
    id=con.insert_id()
    cmd.execute("insert into publicregistration values('"+str(id)+"','" + name + "','"+place+"','"+email+"','"+phone+"')")

    con.commit()
    return render_template("login.html")



@root.route('/publicpostdom',methods=['get','post'])
def publicpostdom():
    post = request.form['textarea']
    id=session['id']

    cmd.execute("insert into post values(null,'"+str(id)+"','" + post + "',curdate())")
    con.commit()
    return render_template("post.html")

@root.route('/send',methods=['get','post'])
def send():
    id = request.args.get('id')
    session['rid']=id
    return render_template("reply.html")

@root.route('/replycyber',methods=['get','post'])
def replycyber():

    id=session['rid']
    reply=request.form['reply'];
    cmd.execute("update admin_report set status='"+reply+"' where id='"+str(id)+"'")
    con.commit()
    return render_template("cybercell home.html")

@root.route('/laws')
def laws():
    cmd.execute("select * from law ")
    con.commit()
    s=cmd.fetchall()

    return render_template("viewlaws.html",val=s)



if(__name__=='__main__'):
    root.run(debug=True)