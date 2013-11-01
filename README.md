ScrapeTest
==========

The differences between renderInContext and drawViewHierarchyInRect is unknown to me because I don't have the divining rod of Apple insider knowledge.  So, empirical testing it is.

This app tests renderInContext vs drawViewHierarchyInRect.  rIC is done at 0.0 (device native), 1.0, and 2.0 scales while dVHIR just does what it does.  It tests speed differences (if any) between them and there are buttons to save the scrapes to the photo album to compare quality differences.  Theoretically dVHIR should be similar to rIC@0.0 but the images produced aren't quite the same.  rIC@2.0 seems to be more contrasty and sharper than dVHIR for example.

I dunno.
