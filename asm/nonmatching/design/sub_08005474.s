	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005474
sub_08005474: @ 0x08005474
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0800549C @ =gUnknown_0200B204
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080054E4
	movs r3, #0
	cmp r4, #1
	beq _080054BC
	cmp r4, #1
	bgt _080054A0
	cmp r4, #0
	beq _080054A6
	b _0800552C
	.align 2, 0
_0800549C: .4byte gUnknown_0200B204
_080054A0:
	cmp r4, #2
	beq _080054D0
	b _0800552C
_080054A6:
	ldr r0, _080054B8 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	orrs r0, r1
	b _0800552A
	.align 2, 0
_080054B8: .4byte gUnknown_0200B0B0
_080054BC:
	ldr r0, _080054CC @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	b _0800552A
	.align 2, 0
_080054CC: .4byte gUnknown_0200B0B0
_080054D0:
	ldr r0, _080054E0 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	orrs r0, r1
	b _0800552A
	.align 2, 0
_080054E0: .4byte gUnknown_0200B0B0
_080054E4:
	movs r3, #0
	cmp r4, #1
	beq _0800550C
	cmp r4, #1
	bgt _080054F4
	cmp r4, #0
	beq _080054FA
	b _0800552C
_080054F4:
	cmp r4, #2
	beq _08005520
	b _0800552C
_080054FA:
	ldr r0, _08005504 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _08005508 @ =0x0000FDFF
	b _08005528
	.align 2, 0
_08005504: .4byte gUnknown_0200B0B0
_08005508: .4byte 0x0000FDFF
_0800550C:
	ldr r0, _08005518 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _0800551C @ =0x0000FBFF
	b _08005528
	.align 2, 0
_08005518: .4byte gUnknown_0200B0B0
_0800551C: .4byte 0x0000FBFF
_08005520:
	ldr r0, _08005534 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _08005538 @ =0x0000F7FF
_08005528:
	ands r0, r1
_0800552A:
	strh r0, [r2]
_0800552C:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005534: .4byte gUnknown_0200B0B0
_08005538: .4byte 0x0000F7FF

