	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074D28
sub_08074D28: @ 0x08074D28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r6, #0
	ldr r0, _08074DA0 @ =gUnknown_081CC4E4
	mov sb, r0
	ldr r7, _08074DA4 @ =gUnknown_0202FDFC
	ldr r1, _08074DA8 @ =gUnknown_0861433C
	mov r8, r1
_08074D3E:
	mov r2, sb
	ldr r0, [r2]
	movs r1, #0
	movs r2, #1
	bl sub_0801C210
	adds r4, r0, #0
	ldr r0, [r5, #0x54]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl sub_0801C4D4
	lsls r1, r6, #2
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	str r4, [r0]
	lsls r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x2a
	adds r1, r1, r2
	ldrh r0, [r7]
	ldrh r3, [r7, #4]
	adds r0, r0, r3
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r2
	ldrh r0, [r7, #2]
	ldrh r2, [r7, #6]
	adds r0, r0, r2
	strh r0, [r1]
	adds r6, #1
	cmp r6, #4
	ble _08074D3E
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074DA0: .4byte gUnknown_081CC4E4
_08074DA4: .4byte gUnknown_0202FDFC
_08074DA8: .4byte gUnknown_0861433C

