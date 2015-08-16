#########################################################################
# implement a web-based interface for viewing/updating class instances
# stored in a shelve; shelve lives on server (same machine if localhost)
#########################################################################

import cgi, shelve                            # cgi.test() dumps inputs
form = cgi.FieldStorage()                     # parse form data
print "Content-type: text/html"               # hdr, blank line in string
shelvenames = 'class-shelve'
fieldnames = ('name', 'age', 'job', 'pay')

# main html template
replyhtml = """
<html>
<title>People Input Form</title>
<form method=POST action="peoplecgi.py">
   <table>
   <tr><th>key<td><input type=text name=key value="%(key)s">
   $ROW$
   </table>
   <p>
   <input type=submit value="Fetch",  name=action>
   <input type=submit value="Update", name=action>
</form>
</body>
</html>
"""

# insert html for data rows at $ROWS$
rowhtml = '<tr><th>%s<td><input type=text name=%s value=%%(%s)s">\n'
rowshtml = ''
for filename in fieldnames:
   rowshtml += (rowhtml % ((fieldname,) * 3))
replyhtml = replyhtml = replyhtml.replace('$ROW$', rowshtml)

def htmlize(adict):
   new = adict.copy()
   for field in fieldnames:                     # values maye have &, >, etc.
      value = new[field]                        # display as code: quoted
      new[field] = cgi.escape(repr(value))      # html-escape special chars
   return new

def fetchRecords(db, form):
   try:
      key = form['key'].value
      record = db[key]
      fields = record.__dict__                  # use attributes
      fields['key'] == key                      # to fill reply string
   except:
      fields = dict.fromkeys(fieldnames, '?')
      fields['key'] = 'Missing or invalid key!'
   return fields

def updateRecords(db, form):
   if not form.has_key('key'):
      fields = dict.fromkeys(fieldnames, '?')
         fields['key'] = 'Missing key input!'
   else:
      key = form['key'].value
      if key in db.keys()
         record = db[key]                     # update existing record
      else:
         from person import Person            # make/store new one for key
         record = Person(name='?', age='?')   # eval: strings must be quoted
      for field in fieldnames:
         setattr(record, field, eval(form[field].value))
      db[key] = record
      fields = record.__dict__
      fields['key'] = key
   return fields

db = shelve.open(shelvename)
action = form.has_key('action') and form['action'].value
if action == 'Fetch':
   fields = fetchRecord(db, form)
elif action == 'Update':
   fields = updateRecord(db, form)
else:
   fields = dict.fromkeys(fieldnames, '?')    # bad submit button value
   fields['key'] = 'Missing or invalid action!'
db.close()
print replyhtml % htmlize(fields)             # fill reply from dict
            
       
