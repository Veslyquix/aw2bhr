	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057FE8
sub_08057FE8: @ 0x08057FE8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r0, _0805804C @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08058050 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r0, [r0]
	mov ip, r0
_08058006:
	mov r1, ip
	asrs r1, r4
	movs r0, #1
	ands r1, r0
	adds r5, r4, #1
	cmp r1, #0
	beq _0805803C
	lsls r2, r4, #6
	adds r3, r2, #0
	adds r3, #0x40
	cmp r2, r3
	bge _0805803C
	ldr r0, _08058054 @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r4, #7
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	subs r2, r3, r2
_0805802C:
	ldrb r0, [r1]
	cmp r0, r7
	bne _08058034
	adds r6, #1
_08058034:
	adds r1, #0xc
	subs r2, #1
	cmp r2, #0
	bne _0805802C
_0805803C:
	adds r4, r5, #0
	cmp r4, #3
	ble _08058006
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805804C: .4byte gUnknown_030033EC
_08058050: .4byte gUnknown_08499598
_08058054: .4byte gUnknown_08499594

