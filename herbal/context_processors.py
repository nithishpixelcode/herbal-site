from models import *
from django.core.cache import cache
from django.conf import settings

def main(request):
	context = { 'navigations' : Navigation.objects.filter(publish=True), }
	return context
