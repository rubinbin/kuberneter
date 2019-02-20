%define pcre_ver    8.41
%define pcre_pkg    pcre-%{pcre_ver}.tar.gz
%define ssl_ver     1.1.0f
%define ssl_pkg     openssl-%{ssl_ver}.tar.gz

%define ngx_u       nobody
%define ngx_g       nobody

%define ngx_path    /usr/local/nginx

%define ngx_tmp     /dev/shm
%define ngx_cb      %{ngx_tmp}/client-body
%define ngx_proxy   %{ngx_tmp}/proxy
%define ngx_fcgi    %{ngx_tmp}/fastcgi

Name:       nginx
Version:    1.12.2
Release:    1%{?dist}
Summary:    %{name}

Group:      Applications/Internet
License:    BSD
URL:        http://nginx.org


%description
Nginx

%prep
for src in %{pcre_pkg} %{ssl_pkg} %{name}-%{version}.tar.gz
do
    echo $PWD
    cp -rf %{_sourcedir}/$src . && tar zxf $src
done

%build

cd %{name}-%{version}
./configure --user=%{ngx_u} \
            --group=%{ngx_g} \
            --prefix=%{ngx_path} \
            --with-http_gzip_static_module \
            --with-threads \
            --with-http_ssl_module \
            --with-http_stub_status_module \
            --with-http_v2_module \
            --with-openssl=../openssl-%{ssl_ver} \
            --with-pcre=../pcre-%{pcre_ver} \
            --http-client-body-temp-path=%{ngx_cb} \
            --http-proxy-temp-path=%{ngx_proxy} \
            --http-fastcgi-temp-path=%{ngx_fcgi}

make

%install
cd %{name}-%{version}
mkdir -p %{buildroot}
make install DESTDIR=%{buildroot}

%files
%doc
%{ngx_path}
