from models import *
from django.core.cache import cache
from django.conf import settings

def main(request):
	context = { 'navigations' : Navigation.objects.filter(publish=True), 'products' : Product.objects.filter(publish=True), 'cart' : request.session.get('cart', []) }
	return context
