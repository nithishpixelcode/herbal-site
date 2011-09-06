
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
	url(r'^register/$', 'herbal.views.register', name='register'),
	url(r'^login/$', 'herbal.views.login_view', name='login'),
	url(r'^logout/$', 'herbal.views.logout_view', name='logout'),
	url(r'^$', 'herbal.views.index', name='index'),
	url(r'^search/', 'herbal.views.search', name='search'),
	url(r'^cart-update/$', 'herbal.views.cart_update', name='cart-update'),
	url(r'^cart-delete/$', 'herbal.views.cart_delete', name='cart-delete'),
	url(r'^cart-clear/$', 'herbal.views.cart_clear', name='cart-clear'),
	url(r'^(?P<nav>[-\w]+)/$', 'herbal.views.nav', name='nav'),
	
)

