	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080686E8
sub_080686E8: @ 0x080686E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r1, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08068760 @ =gUnknown_08581210
	bl Proc_Start
	adds r7, r0, #0
	adds r0, #0x29
	strb r6, [r0]
	adds r0, #0x24
	mov r1, r8
	strb r1, [r0]
	movs r0, #0
	mov r8, r0
	strh r5, [r7, #0x30]
	adds r0, r7, #0
	adds r0, #0x32
	strb r4, [r0]
	ldr r0, _08068764 @ =gUnknown_0817DA18
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08068768 @ =gUnknown_08610A38
	ldr r1, _0806876C @ =gUnknown_085D3DD0
	lsls r0, r6, #6
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_08068038
	adds r1, r7, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x4f
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068760: .4byte gUnknown_08581210
_08068764: .4byte gUnknown_0817DA18
_08068768: .4byte gUnknown_08610A38
_0806876C: .4byte gUnknown_085D3DD0

