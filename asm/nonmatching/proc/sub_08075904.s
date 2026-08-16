	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075904
sub_08075904: @ 0x08075904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08075920 @ =gUnknown_08615194
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r2, #0xc
	adds r1, r1, r2
	ldr r3, [r1]
	cmp r3, #0
	bne _08075924
	movs r0, #0
	b _08075996
	.align 2, 0
_08075920: .4byte gUnknown_08615194
_08075924:
	ldr r5, [r3, #4]
	movs r7, #0
	ldrb r0, [r3, #3]
	cmp r7, r0
	bge _08075994
_0807592E:
	movs r4, #0
	adds r1, r7, #1
	mov ip, r1
	ldrb r0, [r3, #2]
	cmp r4, r0
	bge _0807598C
	ldr r6, _0807595C @ =gUnknown_08614280
	ldr r1, _08075960 @ =0x00000FFF
	mov r8, r1
_08075940:
	ldrb r0, [r5]
	cmp r0, #0
	beq _08075982
	ldrb r0, [r3]
	adds r1, r0, r4
	adds r2, r0, #0
	cmp r1, #0x1f
	ble _08075964
	ldr r0, [r6]
	movs r1, #0xf8
	lsls r1, r1, #3
	adds r0, r0, r1
	b _08075966
	.align 2, 0
_0807595C: .4byte gUnknown_08614280
_08075960: .4byte 0x00000FFF
_08075964:
	ldr r0, [r6]
_08075966:
	ldrb r1, [r3, #1]
	adds r1, r1, r7
	lsls r1, r1, #5
	adds r1, r1, r2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r2, r8
	ands r2, r0
	ldrb r0, [r5]
	lsls r0, r0, #0xc
	orrs r2, r0
	strh r2, [r1]
_08075982:
	adds r5, #1
	adds r4, #1
	ldrb r0, [r3, #2]
	cmp r4, r0
	blt _08075940
_0807598C:
	mov r7, ip
	ldrb r1, [r3, #3]
	cmp r7, r1
	blt _0807592E
_08075994:
	movs r0, #1
_08075996:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

