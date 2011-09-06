from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.template import RequestContext
from models import *
from django.template.loader import get_template
from django.utils import simplejson
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from forms import *

def index(request):
	if Navigation.objects.filter(slug='home'):
		nav = Navigation.objects.filter(slug='home')[0]
	else:
		nav = Navigation.objects.get_or_create(title='Homepage', slug='home')
	context = {'nav' : nav }
	return render_to_response('index.html', context, context_instance = RequestContext(request))
	
def login_view(request, message=''):
	if request.POST:
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username, password=password)
		if user is not None:
			if user.is_active:
				login(request, user)
				return HttpResponseRedirect(reverse('index'))
			else:
				message = 'Disabled user'
		else:
			message = 'Invalid authentication'
	context ={'message' : message}
	return render_to_response('login.html', context, context_instance = RequestContext(request))

def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse('index'))

def nav(request, nav):
	nav = Navigation.objects.get(slug=nav)
	context = {'nav' : nav }
	return render_to_response('nav.html', context, context_instance = RequestContext(request))

def cart_delete(request):
	cart = request.session.get('cart', [])
	product = Product.objects.get(id=request.GET['id'])
	print 'before : ' + str(len(cart))
	if product in cart:
		i = pos = 0
		for p in cart:
			if p == product:
				pos = i
			i+=1
		del cart[pos]
	print 'after : ' + str(len(cart))
	request.session['cart'] = cart		
	return HttpResponse('success', mimetype='application/javascript')

def cart_update(request):
	cart = request.session.get('cart', [])
	print cart
	product = Product.objects.get(id=request.GET['id'])

	if product in cart:
		i = pos = 0
		for p in cart:
			if p == product:
				product = p
				cart.pop(i)
				pos = i
			i+=1
		product.quantity = product.quantity + 1		
		cart.insert(pos, product)
	else:
		product.quantity = 1
		cart.append(product)
	request.session['cart'] = cart		
	return HttpResponse('success', mimetype='application/javascript')

def cart_clear(request):
	request.session['cart'] = []
	return HttpResponse('success', mimetype='application/javascript')	

def search (request):
	if request.POST:
		products = Product.objects.filter(title__icontains=request.POST['keyword'])
	else:
		products=[]
	context ={ 'products':products, 'search' : True, 'search_keyword' : request.POST.get('keyword', '')}
	return render_to_response('search.html', context, context_instance = RequestContext(request))
	

def register(request):
	if request.method == 'POST':
		form = RegistrationForm(data=request.POST)
		if form.is_valid():            
			new_user = User.objects.create_user(form.cleaned_data['username'], form.cleaned_data['email'], form.cleaned_data['password1'])
			user = authenticate(username=new_user.username, password=form.cleaned_data['password1'])
			login(request, user)
			return HttpResponseRedirect('/')
	else:
		form = RegistrationForm()
	
	context = { 'form' : form }
	return render_to_response('register.html', context, context_instance = RequestContext(request))

