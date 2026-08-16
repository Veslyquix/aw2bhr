	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B850
sub_0804B850: @ 0x0804B850
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r2, #0
	mov sb, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r2, #0
	ldr r6, _0804B8B0 @ =0x000003FF
	ldr r5, _0804B8B4 @ =gUnknown_085519FC
	ldr r0, _0804B8B8 @ =0x000001FF
	adds r3, r0, #0
_0804B870:
	ldr r1, [r5]
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r3, [r0]
	adds r2, #1
	cmp r2, r6
	ble _0804B870
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0804BB28
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r4, #0
	mov r1, sb
	mov r3, r8
	bl sub_0804BB74
	adds r0, r4, #0
	ldr r1, [sp, #0x1c]
	movs r2, #0x60
	bl sub_0804BB44
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B8B0: .4byte 0x000003FF
_0804B8B4: .4byte gUnknown_085519FC
_0804B8B8: .4byte 0x000001FF

