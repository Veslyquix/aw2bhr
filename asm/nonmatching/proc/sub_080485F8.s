	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080485F8
sub_080485F8: @ 0x080485F8
	push {lr}
	sub sp, #8
	movs r0, #1
	bl sub_080199D0
	ldr r0, _08048638 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #7
	movs r2, #0xf
	movs r3, #0x17
	bl sub_08012BC8
	bl sub_08013AEC
	ldr r0, _0804863C @ =gUnknown_08489530
	bl sub_0801537C
	ldr r0, _08048640 @ =gUnknown_084C30F8
	ldr r0, [r0]
	movs r1, #0x85
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_0801930C
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08048638: .4byte gUnknown_08499578
_0804863C: .4byte gUnknown_08489530
_08048640: .4byte gUnknown_084C30F8

