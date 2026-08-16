	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BF20
sub_0802BF20: @ 0x0802BF20
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x1e]
	movs r1, #6
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r4, #0
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bgt _0802BF62
_0802BF38:
	adds r1, r6, #0
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl sub_0802BDBC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bgt _0802BF62
	cmp r4, #0xe
	bls _0802BF38
_0802BF62:
	bl sub_08013AEC
	ldrh r1, [r5, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r5, r2]
	cmp r0, #0x15
	bne _0802BF76
	movs r0, #0
	str r0, [r5, #8]
	b _0802BF7A
_0802BF76:
	adds r0, r1, #1
	strh r0, [r5, #0x1e]
_0802BF7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

