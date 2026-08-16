	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018194
sub_08018194: @ 0x08018194
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r4, #9
	bl sub_08078198
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080181B0
	movs r4, #1
_080181B0:
	movs r1, #0
	ldr r0, _08018204 @ =gUnknown_08499588
	mov ip, r0
	ldr r7, _08018208 @ =0x0000020B
	mov sb, r7
	lsls r6, r4, #0xc
_080181BC:
	movs r2, #0
	lsls r0, r1, #1
	adds r5, r1, #1
	lsls r4, r1, #5
	adds r0, r0, r1
	lsls r3, r0, #1
_080181C8:
	adds r1, r4, r2
	mov r7, ip
	ldr r0, [r7]
	lsls r1, r1, #1
	adds r1, r1, r0
	mov r7, sb
	adds r0, r2, r7
	adds r0, r0, r3
	adds r0, r0, r6
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #5
	bls _080181C8
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #5
	bls _080181BC
	mov r0, r8
	bl sub_0801815C
	bl sub_080185A0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018204: .4byte gUnknown_08499588
_08018208: .4byte 0x0000020B

