from flask_wtf import Form
from wtfforms import StringField, BooleanField
from wtforms.validators import DataRequired

class LoginForm(Form):
	openid = StringField('openid', validators=[DataRequired()])
	remember_me = BooleanField('remember_me', default=False)
