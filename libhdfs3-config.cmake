# 定义HDFS库的位置

set(LIBHDFS3_HOME "${PROJECT_SOURCE_DIR}/third_party/libhdfs3")
set(LIBHDFS3_INCLUDE_DIRS "${LIBHDFS3_HOME}/include")
set(LIBHDFS3_LIBRARY_DIRS "${LIBHDFS3_HOME}/lib")
message("LIBHDFS3 include path ${LIBHDFS3_INCLUDE_DIRS}")
message("LIBHDFS3 library path ${LIBHDFS3_LIBRARY_DIRS}")

find_library(LIBHDFS3_LIBRARIES NAMES hdfs3 PATHS "${LIBHDFS3_LIBRARY_DIRS}")

# 检查文件是否存在
if (NOT EXISTS "${LIBHDFS3_LIBRARIES}")
    message(FATAL_ERROR "LIBHDFS3 library not found at ${LIBHDFS3_LIBRARIES}")
endif ()

# 创建导入库目标
add_library(LIBHDFS3::LIBHDFS3 SHARED IMPORTED)
set_target_properties(LIBHDFS3::LIBHDFS3 PROPERTIES
        IMPORTED_LOCATION "${LIBHDFS3_LIBRARIES}"
        INTERFACE_INCLUDE_DIRECTORIES "${LIBHDFS3_INCLUDE_DIRS}"
        )
