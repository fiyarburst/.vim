import iterm2
import os
import sys


# split pane
async def main(connection):
    # check envvar $TERM non empty
    if os.environ.get('TERM') is None:
        return

    # check if theres a path argument
    pc = None
    if len(sys.argv) > 1:
        path = sys.argv[1]
        print('path:', path)
        if not os.path.isdir(path):
            return
        pc = iterm2.LocalWriteOnlyProfile()
        pc.set_initial_directory_mode(iterm2.InitialWorkingDirectory.INITIAL_WORKING_DIRECTORY_CUSTOM)
        pc.set_custom_directory(path)
    
        # validate directory

    app = await iterm2.async_get_app(connection)
    window = app.current_window

    if window:
        session = window.current_tab.current_session
        new_session = await session.async_split_pane(vertical=True, 
                                profile_customizations=pc)



if __name__ == '__main__':
    iterm2.run_until_complete(main)
