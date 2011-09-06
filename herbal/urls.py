
from django.conf.urls.defaults import *
from django.conf import settings
from autoregister import autoregister
from models import *
from django.contrib.sitemaps import GenericSitemap

from django.contrib import admin
admin.autodiscover()
autoregister('herbal')

urlpatterns = patterns('',
	(r'^admin/doc/', include('django.contrib.admindocs.urls')),
	(r'^admin/', include(admin.site.urls)),
	(r'^media/(?P<path>.*)$', 'django.views.static.serve',{'document_root': settings.MEDIA_ROOT}),
	url(r'^$', 'herbal.views.index', name='index'),
	url(r'^cart-update/$', 'herbal.views.cart_update', name='cart-update'),
	url(r'^cart-clear/$', 'herbal.views.cart_clear', name='cart-clear'),
	url(r'^(?P<nav>[-\w]+)/$', 'herbal.views.nav', name='nav'),
)

