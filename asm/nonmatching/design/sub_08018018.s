	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018018
sub_08018018: @ 0x08018018
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #9
	mov sb, r0
	bl sub_08078198
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018038
	movs r1, #1
	mov sb, r1
_08018038:
	movs r1, #0
	ldr r2, _0801806C @ =gUnknown_08499588
	mov r8, r2
	ldr r7, _08018070 @ =0x0000020B
	mov ip, r7
_08018042:
	movs r3, #0
	lsls r5, r1, #5
	adds r0, r1, #1
	mov sl, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r4, r0, #1
_08018050:
	adds r0, r3, r6
	cmp r0, #5
	bgt _08018074
	mov r1, ip
	adds r0, r3, r1
	adds r0, r0, r6
	adds r0, r0, r4
	mov r2, sb
	lsls r1, r2, #0xc
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08018076
	.align 2, 0
_0801806C: .4byte gUnknown_08499588
_08018070: .4byte 0x0000020B
_08018074:
	movs r2, #0
_08018076:
	adds r0, r5, r3
	mov r7, r8
	ldr r1, [r7]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08018050
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #5
	bls _08018042
	bl sub_080185A0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

