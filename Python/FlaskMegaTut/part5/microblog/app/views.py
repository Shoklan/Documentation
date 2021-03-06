from flask import render_template, flash, redirect, session, url_for, request, g
from flask_login import login_user, logout_user, current_user, login_required
from app import app, dv, lm, oid
from .forms import LoginForm
from .models import User


@app.route('/')
@app.route('/index')
@login_required
def index():
	user = g.user
	posts = [ # fake array of posts
		{
		'author':{'nickname':'John'},
		'body': 'Beautiful Day in Portland!'
		},
		{
		'author': {'nickname':'Susan'},
		'body': 'The Avengers movie was so cool!'
		}
		]

	return render_template( 'index.html',
                                title='Home',
                                user=user,
				posts=posts)

@app.route('/login', methods = ['GET', 'POST'])
@oid.loginhandler
def login():
	if g.user is not None and g.user.is_authenicated:
		return redirect( url_for('index'))
	form = LoginForm()
	if form.validate_on_submit():
		session['remember_me'] = form.remember_me.data
		return oid.try_login(form.openif.data, ask_for=['nickname', 'email'])
	return render_template('login.html',
                               title = 'Sign In',
                               form = form,
			       providers=app.config['OPENID_PROVIDERS'])

@app.route('/logout')
def logout():
	logout_user()
	return redirect( url_for('index'))


@lm.user_loader
def load_user(id):
	return User.query.get( int(id) )

@app.before_request
def before_request():
	g.user = current_user

