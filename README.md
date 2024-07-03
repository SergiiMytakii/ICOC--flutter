

# The app for the International Churches of Christ (ICOC).
* Includes:
* Songbook ection
* Video section
* Bible teaching ection
* Q&A section

# Refactored:
* Using Bloc instead of GetX as a state manager
* Using repositories to separate data and core layers
* New HomePage design
* New logic in full-text logic, using SQL FTS-4, which allowed to add new languages without any changes
* Multilanguage support


# Notes
* to enable injectable generation run:  flutter packages pub run build_runner watch --delete-conflicting-outputs
* before Pull Request with dev delete Podfile.loc to avoid build crash in Codemagic



