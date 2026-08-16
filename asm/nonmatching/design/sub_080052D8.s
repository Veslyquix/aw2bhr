	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080052D8
sub_080052D8: @ 0x080052D8
	push {r4, r5, lr}
	ldr r4, _08005334 @ =gUnknown_0200B0B0
	ldr r1, [r4]
	ldrh r2, [r1]
	ldr r0, _08005338 @ =0x0000FEFF
	ands r0, r2
	movs r5, #0
	strh r0, [r1]
	movs r0, #1
	strb r0, [r1, #0x10]
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	ldr r1, _0800533C @ =gUnknown_0200B204
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08005358
	ldr r0, [r4]
	adds r0, #0x9c
	bl sub_080051EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800534C
	ldr r0, [r4]
	adds r0, #0x9c
	ldr r1, _08005340 @ =gUnknown_08610A38
	ldr r2, _08005344 @ =0x000027FC
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_08004E38
	ldr r2, [r4]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08005348 @ =gUnknown_08488164
	bl sub_080193B0
	b _0800539E
	.align 2, 0
_08005334: .4byte gUnknown_0200B0B0
_08005338: .4byte 0x0000FEFF
_0800533C: .4byte gUnknown_0200B204
_08005340: .4byte gUnknown_08610A38
_08005344: .4byte 0x000027FC
_08005348: .4byte gUnknown_08488164
_0800534C:
	ldr r0, _08005354 @ =gUnknown_084882E4
	bl sub_080193B0
	b _0800539E
	.align 2, 0
_08005354: .4byte gUnknown_084882E4
_08005358:
	ldr r0, [r4]
	adds r0, #0x9c
	bl sub_080051EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08005398
	ldr r0, [r4]
	adds r0, #0x9c
	ldr r1, _0800538C @ =gUnknown_08610A38
	ldr r2, _08005390 @ =0x000027FC
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_08004E38
	ldr r2, [r4]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08005394 @ =gUnknown_08488224
	bl sub_080193B0
	b _0800539E
	.align 2, 0
_0800538C: .4byte gUnknown_08610A38
_08005390: .4byte 0x000027FC
_08005394: .4byte gUnknown_08488224
_08005398:
	ldr r0, _080053A4 @ =gUnknown_08488394
	bl sub_080193B0
_0800539E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080053A4: .4byte gUnknown_08488394

