	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801FCE0
sub_0801FCE0: @ 0x0801FCE0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r2, _0801FD28 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bhs _0801FD22
	ldr r0, _0801FD2C @ =gUnknown_03003340
	mov ip, r0
	adds r7, r2, #0
_0801FCFE:
	movs r3, #0
	lsls r0, r1, #2
	adds r4, r1, #1
	mov r1, ip
	adds r2, r0, r1
_0801FD08:
	ldr r0, [r2]
	adds r1, r6, r3
	adds r0, r0, r1
	strb r5, [r0]
	adds r3, #1
	cmp r3, #2
	ble _0801FD08
	lsls r0, r4, #0x10
	lsrs r1, r0, #0x10
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blo _0801FCFE
_0801FD22:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD28: .4byte gUnknown_08499590
_0801FD2C: .4byte gUnknown_03003340

