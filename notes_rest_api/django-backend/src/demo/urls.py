from django.conf import settings
from django.contrib import admin
from django.urls import path, include

from .views import index

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        path('__debug__/', include(debug_toolbar.urls)),
    ]
