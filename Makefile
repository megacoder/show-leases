TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	show-leases

${TARGETS}::

clobber distclean:: clean

check::	show-leases
	./show-leases ${ARGS}

install:: show-leases
	${INSTALL} -D show-leases ${BINDIR}/show-leases

uninstall::
	${RM} ${BINDIR}/show-leases

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
