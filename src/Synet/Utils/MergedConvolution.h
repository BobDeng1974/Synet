/*
* Synet Framework (http://github.com/ermig1979/Synet).
*
* Copyright (c) 2018-2019 Yermalayeu Ihar.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

#pragma once

#include "Synet/Utils/ConvParam.h"

namespace Synet
{
    template <class T> class MergedConvolution32f
    {
    public:
        MergedConvolution32f()
            : _context(NULL)
            , _batch(0)
            , _srcH(0)
            , _srcW(0)
        {
        }

        virtual ~MergedConvolution32f()
        {
        }

        void Init(size_t batch, const ConvParam * convs, size_t count, int add)
        {
        }

        bool Enable()
        {
            return _context != NULL;
        }

        size_t ExternalBufferSize() const 
        {
            return 1;
        }

        size_t InternalBufferSize() const
        {
            return 0;
        }

        void SetParams(const T * const * weight, int * internal, const T * const * bias, const T * const * params)
        {
        }

        void Forward(const T * src, T * buf, T * dst)
        {
        }

    private:
        void * _context;
        size_t _batch, _srcH, _srcW;
    };

#ifdef SYNET_SIMD_LIBRARY_ENABLE
    template<> SYNET_INLINE MergedConvolution32f<float>::~MergedConvolution32f()
    {
        if (_context)
            ::SimdRelease(_context);
    }

    template<> SYNET_INLINE void MergedConvolution32f<float>::Init(size_t batch, const ConvParam * convs, size_t count, int add)
    {
        if (_batch != batch || _srcH != convs[0].srcH || _srcW != convs[0].srcW)
        {
            _batch = batch, _srcH = convs[0].srcH, _srcW = convs[0].srcW;
            if (_context)
                ::SimdRelease(_context), _context = NULL;
            if(convs[1].dstH > 1 && convs[1].dstW > 1)
                _context = ::SimdSynetMergedConvolution32fInit(batch, (const SimdConvolutionParameters *)convs, count, (SimdBool)add);
        }
    }

    template<> SYNET_INLINE size_t MergedConvolution32f<float>::ExternalBufferSize() const
    {
        return _context ? ::SimdSynetMergedConvolution32fExternalBufferSize(_context) : 0;
    }

    template<> SYNET_INLINE size_t MergedConvolution32f<float>::InternalBufferSize() const
    {
        return _context ? ::SimdSynetMergedConvolution32fInternalBufferSize(_context) : 0;
    }

    template<> SYNET_INLINE void MergedConvolution32f<float>::SetParams(const float * const * weight, int * internal, const float * const * bias, const float * const * params)
    {
        if (_context)
            ::SimdSynetMergedConvolution32fSetParams(_context, weight, (::SimdBool*)internal, bias, params);
    }

    template<> SYNET_INLINE void MergedConvolution32f<float>::Forward(const float * src, float * buf, float * dst)
    {
        if (_context)
            ::SimdSynetMergedConvolution32fForward(_context, src, buf, dst);
    }
#endif
}