	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BDBC
sub_0802BDBC: @ 0x0802BDBC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _0802BDD2
	movs r2, #6
_0802BDD2:
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0802BDDA
	movs r2, #0
_0802BDDA:
	ldr r0, _0802BE20 @ =gUnknown_08499578
	lsls r1, r3, #2
	ldr r0, [r0]
	adds r3, r0, r1
	lsls r0, r2, #0x10
	asrs r0, r0, #0xe
	ldr r1, _0802BE24 @ =0xFFFF82B0
	adds r0, r0, r1
	lsls r1, r5, #0xa
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	subs r1, r5, #1
	adds r2, r0, r5
	subs r7, r0, r1
	adds r6, r2, #2
	adds r0, #1
	subs r0, r0, r5
	adds r1, r0, #2
_0802BE02:
	strh r2, [r3]
	strh r7, [r3, #2]
	adds r0, r3, #0
	adds r0, #0x40
	strh r6, [r0]
	strh r1, [r0, #2]
	adds r3, #0x80
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0802BE02
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE20: .4byte gUnknown_08499578
_0802BE24: .4byte 0xFFFF82B0

