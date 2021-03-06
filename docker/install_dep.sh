apt-get update

# Alex prerequisites.
apt-get install -y build-essential libpng12-dev libfreetype6-dev python-dev libopenblas-dev libopenblas-base liblapack-dev liblapack3 gfortran  git python python-pip libsqlite3-dev wget libsox-fmt-mp3 libsox-dev flac
apt-get clean
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

# Clone Alex from repository.
mkdir /app
cd /app

pip install -r /tmp/alex-requirements.txt
pip install pystache cython flask theano nose2
easy_install pysox
rm /tmp/alex-requirements.txt

cd /app/
git clone https://github.com/UFAL-DSG/pjsip.git
cd /app/pjsip
./configure CXXFLAGS=-fPIC CFLAGS=-fPIC LDFLAGS=-fPIC CPPFLAGS=-fPIC
make dep
make
make install
cd /app/pjsip/pjsip-apps/src/python/
python setup-pjsuaxt.py install
