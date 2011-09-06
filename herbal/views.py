from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.template import RequestContext
from models import *
from django.template.loader import get_template
from django.utils import simplejson
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

def index(request):
	if Navigation.objects.filter(slug='home'):
		nav = Navigation.objects.filter(slug='home')[0]
	else:
		nav = Navigation.objects.get_or_create(title='Homepage', slug='home')
	context = {'nav' : nav }
	return render_to_response('index.html', context, context_instance = RequestContext(request))

def nav(request, nav):
	nav = Navigation.objects.get(slug=nav)
	context = {'nav' : nav }
	return render_to_response('nav.html', context, context_instance = RequestContext(request))
