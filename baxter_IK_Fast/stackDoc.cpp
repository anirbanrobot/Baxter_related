/* C++ extension to write Python
   Author: Anirban Sinha
   Date: August 29th, 2018
=================================================
*/

#include <Python.h>
#include <numpy/arrayobject.h>
#include <numpy/ndarrayobject.h>
#define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION

extern "C" {
   static PyObject* func_wrap(PyObject* /*self*/, PyObject* args)
   {
      // static double data[4] = {1.0, 2.0, 5.0, 5.5};
      double* ptr;      
      ptr = (double *) malloc(4 * sizeof(double));
      *ptr = 1.0; *(ptr+1) = 2.0; *(ptr+2) = 3.0; *(ptr+3) = 4.0;
      PyArrayObject* pyArr;
      npy_intp dims[2];
      dims[0] = 2;
      dims[1] = 2;
      printf("Before PyArray_SimpleNewFromData()\n");
      pyArr = (PyArrayObject*)PyArray_SimpleNewFromData(2, dims, NPY_DOUBLE, ptr);
      PyArray_ENABLEFLAGS(pyArr, NPY_ARRAY_OWNDATA);  /* Frees allocated memory */
      printf("inside func\n");
      //free(ptr);
      return Py_BuildValue("O", pyArr);
      //return Py_BuildValue("i", 1);
   }

   static PyMethodDef CppMethods[] = {
      {"func", func_wrap, METH_VARARGS, "returns numpy 1by4 array"},
      {NULL, NULL, 0, NULL}
   };

  // Define module information
  static struct PyModuleDef mydemo = {
    PyModuleDef_HEAD_INIT,
    "mydemo",
    "mydemo Module",
    -1,
    CppMethods
  };

  // Init function for module
  PyMODINIT_FUNC PyInit_mydemo(void) {
     import_array();
     return PyModule_Create(&mydemo);
  }
}




