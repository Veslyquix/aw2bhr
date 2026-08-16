	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803662C
sub_0803662C: @ 0x0803662C
	push {lr}
	bl sub_0801F00C
	bl sub_08024584
	bl sub_08011B18
	ldr r0, _0803667C @ =sub_08022048
	bl sub_08011B34
	ldr r0, _08036680 @ =sub_08021DD8
	bl sub_08011B34
	ldr r0, _08036684 @ =sub_0803678C
	bl sub_08011B34
	ldr r0, _08036688 @ =sub_0803550C
	bl sub_08011B34
	ldr r0, _0803668C @ =sub_080246B4
	bl sub_08011B34
	ldr r0, _08036690 @ =sub_08024720
	bl sub_08011B34
	ldr r0, _08036694 @ =sub_08022A6C
	bl sub_08011B34
	ldr r0, _08036698 @ =sub_08043590
	bl sub_08011B34
	ldr r0, _0803669C @ =sub_08036944
	bl sub_080366D0
	ldr r0, _080366A0 @ =sub_080369BC
	bl sub_080366C4
	pop {r0}
	bx r0
	.align 2, 0
_0803667C: .4byte sub_08022048
_08036680: .4byte sub_08021DD8
_08036684: .4byte sub_0803678C
_08036688: .4byte sub_0803550C
_0803668C: .4byte sub_080246B4
_08036690: .4byte sub_08024720
_08036694: .4byte sub_08022A6C
_08036698: .4byte sub_08043590
_0803669C: .4byte sub_08036944
_080366A0: .4byte sub_080369BC

