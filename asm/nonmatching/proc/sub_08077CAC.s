	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077CAC
sub_08077CAC: @ 0x08077CAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [r5, #0x44]
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	movs r2, #0x1e
	bl sub_08074234
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x1e
	subs r6, r0, r7
	cmp r6, r1
	ble _08077CDE
	adds r6, r1, #0
_08077CDE:
	ldr r2, _08077DB4 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08077DB8 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08077DBC @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r3, _08077DC0 @ =gUnknown_03001FFC
	ldr r1, [r5, #0x44]
	movs r0, #5
	subs r0, r0, r1
	strh r0, [r3]
	ldrh r1, [r2]
	ldr r0, _08077DC4 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1d
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08077DC8 @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	movs r4, #0
	mov r8, r4
	str r4, [sp, #4]
	ldr r4, _08077DCC @ =gUnknown_0849957C
	ldr r1, [r4]
	ldr r2, _08077DD0 @ =0x01000140
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, _08077DD4 @ =gUnknown_08551A04
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4a
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #5
	adds r2, r2, r7
	lsls r2, r2, #1
	ldr r1, [r4]
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x4e
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r6, #0
	bl sub_08071900
	bl sub_08013AFC
	ldr r0, [r5, #0x44]
	cmp r0, #4
	ble _08077DE0
	mov r0, r8
	str r0, [r5, #0x44]
	bl sub_0803CEAC
	bl sub_08012358
	movs r0, #2
	bl sub_080752D8
	movs r0, #2
	bl sub_08074EEC
	bl sub_08013C54
	bl sub_08037678
	ldr r2, _08077DD8 @ =gUnknown_08615194
	ldr r3, _08077DDC @ =gUnknown_0202FDFC
	ldr r0, [r3, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrh r0, [r1, #6]
	ldrh r2, [r3]
	subs r0, r0, r2
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1, #8]
	ldrh r2, [r3, #2]
	subs r1, r1, r2
	adds r1, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #2
	adds r3, r5, #0
	bl sub_0807548C
	adds r0, r5, #0
	bl Proc_Break
	b _08077DE4
	.align 2, 0
_08077DB4: .4byte gUnknown_030030E0
_08077DB8: .4byte gUnknown_03002020
_08077DBC: .4byte gUnknown_03002B28
_08077DC0: .4byte gUnknown_03001FFC
_08077DC4: .4byte 0x0000FFE0
_08077DC8: .4byte gUnknown_0300064C
_08077DCC: .4byte gUnknown_0849957C
_08077DD0: .4byte 0x01000140
_08077DD4: .4byte gUnknown_08551A04
_08077DD8: .4byte gUnknown_08615194
_08077DDC: .4byte gUnknown_0202FDFC
_08077DE0:
	adds r0, #1
	str r0, [r5, #0x44]
_08077DE4:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

