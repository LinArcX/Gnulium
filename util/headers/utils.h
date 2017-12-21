#pragma once
#include <QWidget>
#include <memory>
class QString;


    class Utils
    {
    public:
        Utils();
        static void DestructorMsg(const QString value);
        static void DestructorMsg(const QObject * const object);
        template<typename T, typename... Args>
        static std::unique_ptr<T> make_unique(Args&&... args)
        {
            return std::unique_ptr<T> (new T(std::forward<Args>(args)...));
        }



    private:
        explicit Utils(const Utils& rhs) = delete;
        Utils& operator= (const Utils& rhs) = delete;
    };




