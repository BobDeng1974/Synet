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

#include "Synet/Utils/Math.h"
#include "Synet/Params.h"

namespace Synet
{
    namespace Detail
    {
        template<class S, class D, class F> SYNET_INLINE D Convert(S value, F scale, F shift, int lower, int upper)
        {
            return (D)(F(value) * scale + shift);
        }

        template<> SYNET_INLINE uint8_t Convert<int32_t, uint8_t, float>(int32_t value, float scale, float shift, int lower, int upper)
        {
            return (uint8_t)RestrictRange(Synet::Quantize(float(value) * scale + shift), lower, upper);
        }

        template<> SYNET_INLINE uint8_t Convert<float, uint8_t, float>(float value, float scale, float shift, int lower, int upper)
        {
            return (uint8_t)RestrictRange(Synet::Quantize(value * scale + shift), lower, upper);
        }

        template<> SYNET_INLINE int8_t Convert<float, int8_t, float>(float value, float scale, float shift, int lower, int upper)
        {
            return (int8_t)RestrictRange(Synet::Quantize(value * scale + shift), lower, upper);
        }

        template<class S, class D, class F> void Convert(const S* src, size_t batch, size_t channels, size_t height,
            size_t width, TensorFormat format, const F* scale, const F* shift, int lower, int upper, D* dst)
        {
            for (size_t b = 0; b < batch; ++b)
            {
                if (format == TensorFormatNchw)
                {
                    for (size_t c = 0; c < channels; ++c)
                    {
                        F _scale = scale[c];
                        F _shift = shift[c];
                        for (size_t h = 0; h < height; ++h)
                        {
                            for (size_t w = 0; w < width; ++w)
                                dst[w] = Convert<S, D, F>(src[w], _scale, _shift, lower, upper);
                            src += width;
                            dst += width;
                        }
                    }
                }
                else if (format == TensorFormatNhwc)
                {
                    for (size_t h = 0; h < height; ++h)
                    {
                        for (size_t w = 0; w < width; ++w)
                        {
                            for (size_t c = 0; c < channels; ++c)
                                dst[c] = Convert<S, D, F>(src[c], scale[c], shift[c], lower, upper);
                            src += channels;
                            dst += channels;
                        }
                    }
                }
                else
                    assert(0);
            }
        }
    }

    inline int8_t Convert32fTo8iSym(const float value, float scale)
    {
        return Detail::Convert<float, int8_t, float>(value, scale, 0.0f, -128, 127);
    }

    struct Converter
    {
        size_t batch, channels, height, width;
        TensorFormat format;
        const float * scale, * shift;
        int lower, upper;

        Converter()
            : batch(0) 
            , channels(0) 
            , height(0)
            , width(0)
            , format(TensorFormatUnknown) 
            , scale(NULL) 
            , shift(NULL) 
            , lower(INT_MIN)
            , upper(INT_MAX)
        {
        }

        void Init(size_t b, size_t c, size_t h, size_t w, TensorFormat f, const float * k, const float * s, int l, int u)
        {
            batch = b;
            channels = c;
            height = h;
            width = w;
            format = f;
            scale = k;
            shift = s;
            lower = l;
            upper = u;
        }

        void Convert(const float* src, uint8_t* dst)
        {
            SYNET_PERF_FUNC();

            Detail::Convert<float, uint8_t, float>(src, batch, channels, height, width, format, scale, shift, lower, upper, dst);
        }

        void Convert(const int32_t* src, float* dst)
        {
            SYNET_PERF_FUNC();

            Detail::Convert<int32_t, float, float>(src, batch, channels, height, width, format, scale, shift, lower, upper, dst);
        }

        void Convert(const int32_t* src, uint8_t* dst)
        {
            SYNET_PERF_FUNC();

            Detail::Convert<int32_t, uint8_t, float>(src, batch, channels, height, width, format, scale, shift, lower, upper, dst);
        }
    };
}