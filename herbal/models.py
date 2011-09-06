from django.db import models
from django.contrib.auth.models import User, Group
from widgets import RemovableImageField
from datetime import datetime
from django.db.models import permalink
from south.modelsinspector import add_introspection_rules
from django.template.defaultfilters import truncatewords_html

class Navigation(models.Model):
	title = models.CharField(max_length=200)
	slug = models.SlugField(unique=True)
	order = models.IntegerField(null=True, blank=True)
	content = models.TextField(null=True, blank=True)
	image = RemovableImageField(upload_to='images/navigations/', null=True, blank=True)
	publish = models.BooleanField(default=True)
	publish_date = models.DateTimeField(default=datetime.now())
	
	class Meta:
		ordering = ['order',]
		
	def __unicode__(self):
		return self.title
	
	def get_absolute_url(self):
		if 'home' in self.slug:
			return ''
		return '%s/' % (self.slug)

	def save(self, *args, **kwargs):
		super(Navigation, self).save()
		try:
			ping_google()
		except Exception:
			# Bare 'except' because we could get a variety
			# of HTTP-related exceptions.
			pass
	

class Product(models.Model):
	title = models.CharField(max_length=200, unique=True)
	order = models.IntegerField(null=True, blank=True)
	description = models.TextField(null=True, blank=True)
	price = models.DecimalField(max_digits=10, decimal_places=2) 
	image = RemovableImageField(upload_to='images/products/')
	featured = models.BooleanField(default=True)
	publish = models.BooleanField(default=True)
	publish_date = models.DateTimeField(default=datetime.now())
	
	class Meta:
		ordering = ['order',]
		
	def __unicode__(self):
		return self.title

	def save(self, *args, **kwargs):
		super(Product, self).save()
		try:
			ping_google()
		except Exception:
			# Bare 'except' because we could get a variety
			# of HTTP-related exceptions.
			pass
