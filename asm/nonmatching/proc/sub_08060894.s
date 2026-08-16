	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060894
sub_08060894: @ 0x08060894
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r4, #0
	movs r0, #2
	bl sub_08060ED4
	cmp r0, #0
	beq _08060926
	ldr r0, _08060910 @ =gUnknown_03004674
	ldr r2, [r0]
	ldr r5, _08060914 @ =gUnknown_0816DAD4
	cmp r2, #0
	beq _080608C0
	ldr r0, [r5]
	ldr r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	adds r1, r2, #0
	bl __divsi3
	adds r4, r0, #0
_080608C0:
	ldr r5, [r5]
	ldr r6, _08060918 @ =gUnknown_085766E0
	ldr r1, [r6]
	ldr r0, [r5]
	ldrb r2, [r1]
	cmp r0, r2
	blt _080608F6
	ldrb r1, [r1, #2]
	cmp r4, r1
	ble _080608F6
	movs r0, #0
	bl sub_08061DA8
	adds r2, r0, #0
	cmp r2, #0
	beq _08060926
	ldr r1, [r5]
	movs r0, #0x64
	muls r0, r1, r0
	adds r1, r2, #0
	bl __divsi3
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #1]
	cmp r4, r0
	bgt _08060926
_080608F6:
	bl sub_080129E0
	movs r1, #0x64
	bl __umodsi3
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bhs _08060920
	ldr r1, _0806091C @ =gUnknown_030046C0
	movs r0, #2
	b _08060924
	.align 2, 0
_08060910: .4byte gUnknown_03004674
_08060914: .4byte gUnknown_0816DAD4
_08060918: .4byte gUnknown_085766E0
_0806091C: .4byte gUnknown_030046C0
_08060920:
	ldr r1, _0806092C @ =gUnknown_030046C0
	movs r0, #1
_08060924:
	strb r0, [r1, #6]
_08060926:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806092C: .4byte gUnknown_030046C0

