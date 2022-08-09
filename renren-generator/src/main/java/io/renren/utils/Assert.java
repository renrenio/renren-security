/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.renren.utils;


/**
 * <p>
 * 断言类
 * </p>
 *
 * @author miemie
 * @since 2018-07-24
 */
public final class Assert {

    /**
     * 断言这个 boolean 为 true
     * 为 false 则抛出异常
     *
     * @param expression boolean 值
     * @param message    消息
     */
    public static void isTrue(boolean expression, String message, Object... params) {
        if (!expression) {
            return;
        }
    }

    /**
     * 断言这个 boolean 为 false
     * 为 true 则抛出异常
     *
     * @param expression boolean 值
     * @param message    消息
     */
    public static void isFalse(boolean expression, String message, Object... params) {
        isTrue(!expression, message, params);
    }

    /**
     * 断言这个 object 为 null
     * 不为 null 则抛异常
     *
     * @param object  对象
     * @param message 消息
     */
    public static void isNull(Object object, String message, Object... params) {
        isTrue(object == null, message, params);
    }

    /**
     * 断言这个 object 不为 null
     * 为 null 则抛异常
     *
     * @param object  对象
     * @param message 消息
     */
    public static void notNull(Object object, String message, Object... params) {
        isTrue(object != null, message, params);
    }


}
