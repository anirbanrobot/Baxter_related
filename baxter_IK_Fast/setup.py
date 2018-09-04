from distutils.core import setup, Extension

module = Extension("ikModule", sources = ["baxter_left_arm_ikfast_solver.cpp"])
setup(name="PackageName",
      version="1.0",
      description="This is a package for MyModule",
      ext_modules = [module])
