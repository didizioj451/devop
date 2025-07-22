from django.shortcuts import render
from django.http import HttpResponse
from .models import Post
def home(request):
    posts = Post.objects.all()
    return render(request, 'blog/home.html', {'posts': posts})
def health_check(request):
    return HttpResponse("OK", status=200)